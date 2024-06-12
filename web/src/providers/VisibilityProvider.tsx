import React, {
  Context,
  createContext,
  useContext,
  useEffect,
  useState,
} from "react";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { fetchNui } from "../utils/fetchNui";
import { isEnvBrowser } from "../utils/misc";

const VisibilityCtx = createContext<VisibilityProviderValue | null>(null);

interface VisibilityProviderValue {
  setVisible: (visible: boolean) => void;
  visible: boolean;
}

const fadeStyles = {
  fadeEnter: {
    opacity: 0,
    transition: 'opacity 0.5s ease-in',
  },
  fadeEnterActive: {
    opacity: 1,
  },
  fadeExit: {
    opacity: 1,
    transition: 'opacity 0.5s ease-in',
  },
  fadeExitActive: {
    opacity: 0,
  },
};

// This should be mounted at the top level of your application, it is currently set to
// apply a CSS visibility value. If this is non-performant, this should be customized.
export const VisibilityProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [visible, setVisible] = useState(false);

  useNuiEvent<boolean>("setVisible", (state) => {
    if (state) {
      setTimeout(() => setVisible(true), 0);
    } else {
      setVisible(false);
    }
  });

  // Handle pressing escape/backspace
  useEffect(() => {
    if (!visible) return;

    const keyHandler = (e: KeyboardEvent) => {
      if (["Backspace", "Escape"].includes(e.code)) {
        if (!isEnvBrowser()) fetchNui("hideFrame");
        else setVisible(false);
      }
    };

    window.addEventListener("keydown", keyHandler);

    return () => window.removeEventListener("keydown", keyHandler);
  }, [visible]);

  const currentStyle = visible
    ? { ...fadeStyles.fadeEnter, ...fadeStyles.fadeEnterActive }
    : { ...fadeStyles.fadeExit, ...fadeStyles.fadeExitActive };

  return (
    <VisibilityCtx.Provider
      value={{
        visible,
        setVisible,
      }}
    >
      <div style={{ ...currentStyle, height: "100%" }}>
        {children}
      </div>
    </VisibilityCtx.Provider>
  );
};


export const useVisibility = () =>
  useContext<VisibilityProviderValue>(
    VisibilityCtx as Context<VisibilityProviderValue>,
  );
